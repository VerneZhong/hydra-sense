package com.hydra.server.modules.platform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydra.server.modules.platform.entity.PandoraFile;
import com.hydra.server.modules.platform.mapper.PandoraFileMapper;
import com.hydra.server.modules.platform.service.PandoraFileService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

/**
 * pandora file service implement
 *
 * @author Mr.Zxb
 * @description
 * @date 2023/12/29 22:00
 */
@Service
public class PandoraFileServiceImpl extends ServiceImpl<PandoraFileMapper, PandoraFile> implements PandoraFileService {

    @Override
    public void insertOrUpdate(String fileName, String filePath, String description) {
        PandoraFile pandoraFile = new PandoraFile();
        pandoraFile.setFileName(fileName);
        pandoraFile.setFilePath(filePath);
        pandoraFile.setDescription(description);

        QueryWrapper<PandoraFile> wrapper = new QueryWrapper<>();
        wrapper.eq("file_name", fileName);
        PandoraFile file = Optional.ofNullable(this.getOne(wrapper))
                .map(one -> {
                    // 移除旧文件
                    removeOldFile(one.getFilePath());
                    one.setFilePath(filePath);
                    one.setDescription(description);
                    return one;
                })
                .orElse(pandoraFile);

        saveOrUpdate(file);
    }

    private static void removeOldFile(String filePath) {
        try {
            File file = new File(filePath);
            if (file.exists()) {
                FileUtils.delete(file);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
