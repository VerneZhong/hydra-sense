package com.hydra.server.modules.platform.service;

import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hydra.server.modules.platform.entity.HumidityPandora176 ;

/**
 * 潘多拉176湿度表Service接口
 * 
 * @author hydra
 * @date 2023-12-17
 */
public interface IHumidityPandora176Service extends IService<HumidityPandora176>{
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

    /**
     * 新增潘多拉176湿度表
     * @param humidityPandora176 潘多拉176湿度表
     * @return 结果
     */
    boolean create(HumidityPandora176 humidityPandora176);

    /**
     * 修改潘多拉176湿度表
     * @param humidityPandora176 潘多拉176湿度表
     * @return 结果
     */
    boolean update(HumidityPandora176 humidityPandora176);

    /**
     * 批量删除潘多拉176湿度表
     * 
     * @param ids 需要删除的潘多拉176湿度表主键集合
     * @return 结果
     */
    int deleteHumidityPandora176ByIds(Long[] ids);

    /**
     * 删除潘多拉176湿度表信息
     * 
     * @param id 潘多拉176湿度表主键
     * @return 结果
     */
    int deleteHumidityPandora176ById(Long id);
}
