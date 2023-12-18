package com.hydra.server.modules.platform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hydra.server.modules.platform.entity.Pandora176;
import com.hydra.server.modules.platform.mapper.Pandora176Mapper;
import com.hydra.server.modules.platform.service.IPandora176Service;
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
public class Pandora176ServiceImpl extends ServiceImpl<Pandora176Mapper, Pandora176> implements IPandora176Service {
    @Autowired
    private Pandora176Mapper pandora176Mapper;

    /**
     * 查询【请填写功能名称】列表
     *
     * @param pandora176 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Pandora176> selectPandora176List(Pandora176 pandora176) {
        return pandora176Mapper.selectPandora176List(pandora176);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param pandora176 【请填写功能名称】
     * @return 结果
     */
    @Override
    public boolean create(Pandora176 pandora176) {
        return save(pandora176);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param pandora176 【请填写功能名称】
     * @return 结果
     */
    @Override
    public boolean update(Pandora176 pandora176) {
        return updateById(pandora176);
    }

    @Override
    public List<PandoraVo> queryList(PandoraQueryVo vo) {
        QueryWrapper<Pandora176> wrapper = new QueryWrapper<>();
        wrapper.le("time", vo.getStartTime());
        wrapper.ge("time", vo.getEndTime());
        return pandora176Mapper.selectList(wrapper).stream()
                .map(pandora176 -> PandoraVo.builder()
                        .humidity(pandora176.getHumidity())
                        .time(pandora176.getTime())
                        .build())
                .collect(Collectors.toList());
    }

}
