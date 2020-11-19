package com.ray.model.service;

import java.util.List;

import com.ray.model.dao.ImageRepository;
import com.ray.model.dao.RepositoryFactory;
import com.ray.model.entities.Arquivo;
import com.ray.util.ArquivosUtil;
import com.ray.util.Miniatura;
import com.ray.util.ThreadMiniature;

public class ImageService {

    private ImageRepository repository = RepositoryFactory.createImageDao();

    /**
     * Seta miniatura e base64  pra "";<br>
     * checa o contentType do arquivo, se nao for uma imagem, seta o tipo de acordo com o contentType <br>
     * inicia o trabalho de thread para criar miniatura.
     * @param arquivo
     * @return
     */
    public Arquivo save(Arquivo arquivo) {
	boolean isImage = arquivo.getContentType().contains("image");
	boolean IsPdf = arquivo.getContentType().contains("pdf");
	if (isImage || IsPdf) {
	    arquivo.setMiniatura("");
	} else {
	    String contentType = ArquivosUtil.getContentType(arquivo.getNome());
	    arquivo.setContentType("application/" + contentType);
	    arquivo.setMiniatura("null");
	}
	arquivo.setBase64("");
	Arquivo fileToSave = repository.save(arquivo);
	new ThreadMiniature(fileToSave);
	return fileToSave;
    }

    public Arquivo update(Arquivo arquivo, boolean updateInputStream) {
	return repository.update(arquivo, updateInputStream);
    }

    public boolean deleteById(Long id) {
	Long withoutImage = 0L;
	boolean hasImage = !id.equals(withoutImage);
	if (hasImage) {
	    repository.deleteById(id);
	    return true;
	}
	return false;
    }

    /**
     * 
     * @param canecaId        - todas as imagens de acordo com o id da caneca
     * @param withInputStream - <br>
     *                        setar true para caso queira a lista completa, com
     *                        todos os atributos. <br>
     *                        Setar falso caso queira a lista parcialmente completa,
     *                        sem inputstream
     * @return todas as canecas
     */
    public List<Arquivo> findAll(Long canecaId, boolean withInputStream) {
	List<Arquivo> arquivos = repository.findAll(canecaId);
	arquivos.forEach(x -> setMiniature(x));
	if (withInputStream) {
	    return arquivos;
	}

	arquivos.forEach(x -> x.setInputStream(null));
	return arquivos;
    }

    /**
     * Seta miniatura de acordo com seu tipo de arquivo caso nao seja uma imagem
     * @param arquivo
     */
    private void setMiniature(Arquivo arquivo) {
	boolean notAImage = !arquivo.getContentType().contains("image");
	if (notAImage) {
	    if (arquivo.getContentType().contains("pdf")) {
		arquivo.setMiniatura(Miniatura.PDF);
	    }else if(arquivo.getContentType().contains("docx")) {
		arquivo.setMiniatura(Miniatura.WORD);
	    }else if(arquivo.getContentType().contains("psd")) {
		arquivo.setMiniatura(Miniatura.PSD);
	    }else if(arquivo.getContentType().contains("eps")) {
		arquivo.setMiniatura(Miniatura.EPS);
	    }
	}
    }
}
