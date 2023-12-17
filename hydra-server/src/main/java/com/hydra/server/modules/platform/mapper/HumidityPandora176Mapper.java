package com.hydra.server.modules.platform.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hydra.server.modules.platform.entity.HumidityPandora176;

/**
 * 潘多拉176湿度表Mapper接口
 * 
 * @author hydra
 * @date 2023-12-17
 */
public interface HumidityPandora176Mapper extends BaseMapper<HumidityPandora176>{
    /**
     * 查询潘多拉176湿度表
     * @param id 潘多拉176湿度表主键
     * @return 潘多拉176湿度表
     */
    HumidityPandora176 selectHumidityPandora176ById(Long id);

    /**
     * 查询潘多拉176湿度表列表
     * @param humidityPandora176 潘多拉176湿度表
     * @return 潘多拉176湿度表集合
     */
   List<HumidityPandora176> selectHumidityPandora176List(HumidityPandora176 humidityPandora176);

}
