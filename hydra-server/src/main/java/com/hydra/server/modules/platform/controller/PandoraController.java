package com.hydra.server.modules.platform.controller;

import com.hydra.common.controller.BaseController;
import com.hydra.common.enums.PandoraType;
import com.hydra.common.page.TableDataInfo;
import com.hydra.server.modules.platform.service.IPandora176Service;
import com.hydra.server.modules.platform.service.IPandora194Service;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * 【请填写功能名称】Controller
 * 
 * @author hydra
 * @date 2023-12-18
 */
@RestController
@RequestMapping("/system/pandora")
@AllArgsConstructor
public class PandoraController extends BaseController {

    private final IPandora176Service pandora176Service;
    private final IPandora194Service pandora194Service;

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

}
