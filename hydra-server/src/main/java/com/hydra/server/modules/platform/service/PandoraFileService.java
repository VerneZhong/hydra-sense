package com.hydra.server.modules.platform.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hydra.server.modules.platform.entity.PandoraFile;

/**
 * pandora file service api
 * @author verne.zhong
 */
public interface PandoraFileService extends IService<PandoraFile> {
    void insertOrUpdate(String fileName, String filePath, String description);
}
