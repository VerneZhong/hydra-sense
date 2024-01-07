package com.hydra.server.modules.platform.service.impl;

import com.hydra.common.enums.PandoraType;
import com.hydra.server.modules.platform.entity.Pandora;
import com.hydra.server.modules.platform.mapper.PandoraMapper;
import com.hydra.server.modules.platform.service.IPandoraService;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 【pandora】Service业务层处理
 *
 * @author hydra
 * @date 2023-12-18
 */
@Service
public class PandoraServiceImpl implements IPandoraService {
    private final PandoraMapper pandoraMapper;

    public PandoraServiceImpl(PandoraMapper pandoraMapper) {
        this.pandoraMapper = pandoraMapper;
    }

    @Override
    public List<PandoraVo> queryList(PandoraQueryVo vo) {
        List<Pandora> pandoraList = List.of();

        if (vo.getPandoraType() == PandoraType.P176.getType()) {
            pandoraList = pandoraMapper.selectPandora176List(vo.getStartTime(), vo.getEndTime());
        }
        if (vo.getPandoraType() == PandoraType.P193.getType()) {
            pandoraList = pandoraMapper.selectPandora193List(vo.getStartTime(), vo.getEndTime());
        }
        if (vo.getPandoraType() == PandoraType.P194.getType()) {
            pandoraList = pandoraMapper.selectPandora194List(vo.getStartTime(), vo.getEndTime());
        }
        if (vo.getPandoraType() == PandoraType.P197.getType()) {
            pandoraList = pandoraMapper.selectPandora197List(vo.getStartTime(), vo.getEndTime());
        }
        if (vo.getPandoraType() == PandoraType.P198.getType()) {
            pandoraList = pandoraMapper.selectPandora198List(vo.getStartTime(), vo.getEndTime());
        }
        if (vo.getPandoraType() == PandoraType.P199.getType()) {
            pandoraList = pandoraMapper.selectPandora199List(vo.getStartTime(), vo.getEndTime());
        }
        return pandoraList
                .stream()
                .map(pandora176 -> PandoraVo.builder()
                        .humidity(pandora176.getHumidity())
                        .time(pandora176.getTime())
                        .build())
                .collect(Collectors.toList());
    }

}
