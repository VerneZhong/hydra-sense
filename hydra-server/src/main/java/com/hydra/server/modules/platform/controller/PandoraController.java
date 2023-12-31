package com.hydra.server.modules.platform.controller;

import com.hydra.common.annotation.Log;
import com.hydra.common.controller.BaseController;
import com.hydra.common.enums.BusinessType;
import com.hydra.common.result.R;
import com.hydra.server.modules.platform.entity.PandoraFile;
import com.hydra.server.modules.platform.service.IPandoraService;
import com.hydra.server.modules.platform.service.PandoraFileService;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

/**
 * Pandora Controller
 * 
 * @author hydra
 * @date 2023-12-18
 */
@RestController
@RequestMapping("/system/pandora")
public class PandoraController extends BaseController {

    private final IPandoraService pandoraService;
    private final PandoraFileService pandoraFileService;

    @Value("${file.upload-dir}")
    private String filePath;

    @Value("${file.nginx-url}")
    private String nginxUrl;

    public PandoraController(IPandoraService pandoraService,
                             PandoraFileService pandoraFileService) {
        this.pandoraService = pandoraService;
        this.pandoraFileService = pandoraFileService;
    }

    @PreAuthorize("@customSs.hasPermi('system:pandora:queryList')")
    @PostMapping("/queryList")
    public R queryList(@RequestBody PandoraQueryVo vo) {
        return R.ok(pandoraService.queryList(vo));
    }

    @ApiOperation(value = "图片上传")
    @Log(title = "图片上传", businessType = BusinessType.UPDATE)
    @PostMapping("/uploadImg")
    public R uploadImg(@RequestParam("file") MultipartFile file,
                       @RequestParam("fileName") String fileName,
                       @RequestParam("description") String description) {
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
            // 检查目录是否存在，如果不存在，则创建
            if (Files.notExists(resolve.getParent())) {
                Files.createDirectories(resolve.getParent());
            }
            // 然后复制文件
            Files.copy(file.getInputStream(), resolve, StandardCopyOption.REPLACE_EXISTING);

            // 将文件路径存储到数据库中
            pandoraFileService.insertOrUpdate(fileName, resolve.toAbsolutePath().toString(), description);

            // 返回成功响应
            return R.ok("File uploaded successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("There is an abnormality in uploading pictures, please contact the administrator.");
        }
    }

    @GetMapping("/getPandoraFile")
    public R getPandoraFile() {
        List<PandoraFile> list = pandoraFileService.list().stream().peek(f -> {
            String replace = f.getFilePath().replace(filePath, nginxUrl);
            f.setFilePath(replace);
        }).collect(Collectors.toList());
        return R.ok(list);
    }

}