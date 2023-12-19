package com.hydra.server.modules.platform.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydra.server.modules.platform.entity.Pandora176;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author hydra
 * @date 2023-12-18
 */
public interface Pandora176Mapper extends BaseMapper<Pandora176>{
    /**
     * 查询【请填写功能名称】
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    Pandora176 selectPandora176ById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * @param pandora176 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
   List<Pandora176> selectPandora176List(Pandora176 pandora176);

    /**
     * 查询列表
     * @param startTime
     * @param endTime
     * @return
     */
    List<Pandora176> selectPandoraList(@Param("startTime") String startTime, @Param("endTime") String endTime);
}
