package com.ray.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.regex.PatternSyntaxException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.tomcat.util.codec.binary.Base64;
import org.imgscalr.Scalr;

import com.ray.beans.User;
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

	final int WIDHT = 250;
	final int HEIGHT = 250;
	
	/*
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
	    byte[] fileBytes = null;
	    String[] contentType = null;
	    fileBytes = Base64.decodeBase64(arquivo.getBase64());
	    contentType = arquivo.getContentType().split("/");
	    fileBytes = Base64.decodeBase64(arquivo.getBase64());
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
}
