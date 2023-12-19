package com.hydra.server.modules.platform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydra.server.modules.platform.entity.Pandora194;
import com.hydra.server.modules.platform.mapper.Pandora194Mapper;
import com.hydra.server.modules.platform.service.IPandora194Service;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author hydra
 * @date 2023-12-18
 */
@Service
public class Pandora194ServiceImpl extends ServiceImpl<Pandora194Mapper, Pandora194> implements IPandora194Service {
    @Autowired
    private Pandora194Mapper pandora194Mapper;

    @Override
    public List<PandoraVo> queryList(PandoraQueryVo vo) {
        return pandora194Mapper.selectPandoraList(vo.getStartTime(), vo.getEndTime())
                .stream()
                .map(pandora194 -> PandoraVo.builder()
                        .humidity(pandora194.getHumidity())
                        .time(pandora194.getTime())
                        .build())
                .collect(Collectors.toList());
    }

}
