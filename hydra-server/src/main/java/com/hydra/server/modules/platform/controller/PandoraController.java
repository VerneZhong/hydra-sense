package com.hydra.server.modules.platform.controller;

import com.hydra.common.annotation.Log;
import com.hydra.common.controller.BaseController;
import com.hydra.common.enums.BusinessType;
import com.hydra.common.enums.PandoraType;
import com.hydra.common.page.TableDataInfo;
import com.hydra.common.result.R;
import com.hydra.server.modules.platform.service.IPandora176Service;
import com.hydra.server.modules.platform.service.IPandora194Service;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

/**
 * Pandora Controller
 * 
 * @author hydra
 * @date 2023-12-18
 */
@RestController
@RequestMapping("/system/pandora")
public class PandoraController extends BaseController {

    private final IPandora176Service pandora176Service;
    private final IPandora194Service pandora194Service;

    @Value("${file.upload-dir}")
    private String filePath;

    public PandoraController(IPandora176Service pandora176Service, IPandora194Service pandora194Service) {
        this.pandora176Service = pandora176Service;
        this.pandora194Service = pandora194Service;
    }

    @PreAuthorize("@customSs.hasPermi('system:pandora:queryList')")
    @PostMapping("/queryList")
    public TableDataInfo queryList(@RequestBody PandoraQueryVo vo) {
        List<PandoraVo> list = List.of();
        if (vo.getPandoraType() == PandoraType.P176.getType()) {
            list = pandora176Service.queryList(vo);
        }
        if (vo.getPandoraType() == PandoraType.P194.getType()) {
            list = pandora194Service.queryList(vo);
        }
        return getDataTable(list);
    }

    @ApiOperation(value = "图片上传")
    @Log(title = "图片上传", businessType = BusinessType.UPDATE)
    @PostMapping("/uploadImg")
    public R uploadImg(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return R.error("File is empty, please select a file to upload.");
        }

        try {
            // 检查文件是否是图片
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image")) {
                return R.error("File type is not supported, please upload an image.");
            }

            // 生成新的文件名，避免覆盖现有文件
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String savedFileName = UUID.randomUUID() + fileExtension;

            // 保存文件
            Path resolve = Paths.get(filePath).resolve(savedFileName);
            Files.copy(file.getInputStream(), resolve);

            // todo 将文件路径存储到数据库中
//            String realPath = resolve.toAbsolutePath().toString();

            // 返回成功响应
            return R.ok("File uploaded successfully: " + savedFileName);
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("There is an abnormality in uploading pictures, please contact the administrator.");
        }
    }

}
