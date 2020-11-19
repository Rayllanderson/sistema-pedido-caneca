package com.ray.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.List;
import java.util.regex.PatternSyntaxException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.tomcat.util.codec.binary.Base64;
import org.imgscalr.Scalr;

import com.ray.model.dao.ImageRepository;
import com.ray.model.entities.Arquivo;
import com.ray.model.exceptions.EntradaInvalidaException;

public class ArquivosUtil implements Serializable{


    private static final long serialVersionUID = 1L;

    /**
     * Converte a imagem em base 64, converte em PNG e então inicia o processo de
     * criação de miniatura
     * 
     * @param request
     * @return imagem em forma de miniatura
     * @throws Exception 
     * @throws ServletException
     * @throws EntradaInvalidaException tipo de arquivo inválido
     */
    public static String createMiniatureBase64(String base64)
	    throws Exception {

	/* Transforma emum bufferedImage */
	byte[] imageByteDecode = Base64.decodeBase64(base64);
	BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imageByteDecode));
	BufferedImage croped = resizeImage(bufferedImage, 320, 320);
	
	/* Pega o tipo da imagem */
	int type = bufferedImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : bufferedImage.getType();

	 /* Cria imagem em miniatura 
	BufferedImage resizedImage = new BufferedImage(WIDHT, HEIGHT, type);
	resizedImage.createGraphics().drawImage(croped, 0, 0, null); */

	/* Escrever imagem novamente */
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	ImageIO.write(croped, "png", baos);
	return "data:image/png;base64," + DatatypeConverter.printBase64Binary(baos.toByteArray());
    }

    /**
     * retorna a base 64 do arquivo
     * 
     * @param 
     * @return "data:" + contentType + ";base64,"
     */
    public static String createBase64(InputStream imagem, String contentType)
	    throws IOException{
	return "data:" + contentType + ";base64," + Base64.encodeBase64String(streamToByte(imagem));
    }
    
    /**
     * 
     * @param imagem
     * @return apenas a base64, sem data e contentType
     * @throws IOException
     */
    public static String createBase64(InputStream imagem) throws IOException{
	return Base64.encodeBase64String(streamToByte(imagem));
    }

    private static byte[] streamToByte(InputStream imagem) throws IOException {
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	int reads = imagem.read();
	while (reads != -1) {
	    baos.write(reads);
	    reads = imagem.read();
	}
	return baos.toByteArray();
    }
    
    private static BufferedImage resizeImage(BufferedImage originalImage, int targetWidth, int targetHeight) throws Exception {
	    return Scalr.resize(originalImage, Scalr.Method.AUTOMATIC, Scalr.Mode.AUTOMATIC, targetWidth, targetHeight, Scalr.OP_ANTIALIAS);
    }
    
    public static void downloadFile(HttpServletResponse response, Arquivo arquivo)
	    throws IOException, PatternSyntaxException, NullPointerException {
	if (arquivo != null) {
	    // converte a base64 da img do BD para byte
	    String[] contentType = null;
	    contentType = arquivo.getContentType().split("/");
	    String name = arquivo.getCaneca().getCliente().getNome();
	    response.setHeader("Content-Disposition", "attachment;filename=" + name +"." + contentType[1]);
	    // coloca os bytes em um objeto de entrada pra processar
	    InputStream inputStream = arquivo.getInputStream();
	    // inicio da resposta pro navegador
	    int read = 0;
	    byte[] bytes = new byte[1024];
	    OutputStream outputStream = response.getOutputStream();
	    while ((read = inputStream.read(bytes)) != -1) {
		outputStream.write(bytes, 0, read);
	    }
	    outputStream.flush();
	    outputStream.close();
	}
    }
    
    public static String getContentType(String nameOfFile) {
	return nameOfFile.substring(nameOfFile.lastIndexOf('.') + 1);
    }
    
    /**
     * Se alguma thumb estiver com valor vazio (ou seja, carregando), return true;
     * 
     * @param arquivos
     * @return
     */
    public static boolean thumbIsLoading(List<Arquivo> arquivos) {
	for (Arquivo i : arquivos) {
	    if (i.getMiniatura().equals("")) {
		return true;
	    }
	}
	return false;
    }

    /**
     * Enquanto a thread que cria miniatura não termina, ela irá buscar ela mesma no
     * banco de dados pra verificar se a criação da miniatura já terminou.
     * 
     * @param loadAll - setar para true caso queira carregar todas as miniaturas.
     *                False para carregar apenas a primeira
     * @param imagens - lista de imagens de uma caneca
     */
    public static void loadThumb(List<Arquivo> imagens, boolean loadAll, ImageRepository arquivoRepository) {
	if (loadAll) {
	    for (Arquivo i : imagens) {
		while (i.getMiniatura().equals("")) {
		    i = arquivoRepository.findById(i.getId());
		}
	    }
	} else {
	    Arquivo firstImage = imagens.get(0);
	    while (firstImage.getMiniatura().equals("")) {
		firstImage = arquivoRepository.findById(firstImage.getId());
	    }
	}
    }
    
	public static String getReadableFileSize(int bytes) {
	    long absB = bytes == Long.MIN_VALUE ? Long.MAX_VALUE : Math.abs(bytes);
	    if (absB < 1024) {
	        return bytes + " B";
	    }
	    long value = absB;
	    CharacterIterator ci = new StringCharacterIterator("KM");
	    for (int i = 40; i >= 0 && absB > 0xfffccccccccccccL >> i; i -= 10) {
	        value >>= 10;
	        ci.next();
	    }
	    value *= Long.signum(bytes);
	    return String.format("%.1f %cB", value / 1024.0, ci.current());
	}
}
