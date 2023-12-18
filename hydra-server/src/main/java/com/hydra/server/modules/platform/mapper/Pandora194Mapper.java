package com.hydra.server.modules.platform.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydra.server.modules.platform.entity.Pandora194;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author hydra
 * @date 2023-12-18
 */
public interface Pandora194Mapper extends BaseMapper<Pandora194>{
    /**
     * 查询【请填写功能名称】
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    Pandora194 selectPandora176ById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * @param pandora176 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
   List<Pandora194> selectPandora176List(Pandora194 pandora176);

}
