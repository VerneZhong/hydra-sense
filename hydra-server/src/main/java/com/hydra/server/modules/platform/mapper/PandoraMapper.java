package com.hydra.server.modules.platform.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydra.server.modules.platform.entity.Pandora;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 【pandora】Mapper接口
 * 
 * @author hydra
 * @date 2023-12-18
 */
public interface PandoraMapper extends BaseMapper<Pandora>{

    /**
     * 查询列表
     * @param startTime
     * @param endTime
     * @return
     */
    List<Pandora> selectPandora176List(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<Pandora> selectPandora193List(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<Pandora> selectPandora194List(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<Pandora> selectPandora197List(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<Pandora> selectPandora198List(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<Pandora> selectPandora199List(@Param("startTime") String startTime, @Param("endTime") String endTime);
}
