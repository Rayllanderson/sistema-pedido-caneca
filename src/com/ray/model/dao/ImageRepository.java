package com.ray.model.dao;

import java.util.List;

import com.ray.model.entities.Arquivo;

public interface ImageRepository {

    Arquivo save(Arquivo arquivo);

    Arquivo update(Arquivo arquivo, boolean updateInputStream);

    void deleteById(Long id);

    Arquivo findById(Long id);
    
    /**
     * apenas com arquivos principais para obter mais velocidade. sao eles: apenas InputStream
     * @param id
     * @return
     */
    Arquivo findByIdHalfElements(Long id);

    List<Arquivo> findAll(Long canecaId);

    /**
      apenas com arquivos principais para obter mais velocidade. São eles: miniatura, nome, contentType e caneca
     * @param canecaId
     * @return
     */
    List<Arquivo> findAllHalfElements(Long canecaId);
}
