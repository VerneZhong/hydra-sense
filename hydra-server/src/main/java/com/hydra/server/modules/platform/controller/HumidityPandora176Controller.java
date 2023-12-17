package com.hydra.server.modules.platform.controller;

import com.hydra.common.controller.BaseController;
import com.hydra.common.page.TableDataInfo;
import com.hydra.common.result.R;
import com.hydra.server.modules.platform.entity.HumidityPandora176;
import com.hydra.server.modules.platform.service.IHumidityPandora176Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;



/**
 * 潘多拉176湿度表Controller
 * 
 * @author hydra
 * @date 2023-12-17
 */
@RestController
@RequestMapping("/system/humidity")
public class HumidityPandora176Controller extends BaseController {
    @Autowired
    private IHumidityPandora176Service humidityPandora176Service;

    /**
     * 查询潘多拉176湿度表列表
     */
    @PreAuthorize("@customSs.hasPermi('system:176:list')")
    @GetMapping("/list")
    public TableDataInfo list(HumidityPandora176 humidityPandora176) {
        startPage();
        List<HumidityPandora176> list = humidityPandora176Service.selectHumidityPandora176List(humidityPandora176);
        return getDataTable(list);
    }

    /**
     * 获取潘多拉176湿度表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('system:176:query')")
    @GetMapping(value = "/{id}")
    public R getInfo(@PathVariable("id") Long id) {
        return R.ok(humidityPandora176Service.selectHumidityPandora176ById(id));
    }

}
