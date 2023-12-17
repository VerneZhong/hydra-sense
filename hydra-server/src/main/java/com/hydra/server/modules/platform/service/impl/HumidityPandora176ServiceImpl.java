package com.hydra.server.modules.platform.service.impl;

import java.util.List;
import java.util.Arrays;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hydra.server.modules.platform.mapper.HumidityPandora176Mapper ;
import com.hydra.server.modules.platform.entity.HumidityPandora176 ;
import com.hydra.server.modules.platform.service.IHumidityPandora176Service ;

/**
 * 潘多拉176湿度表Service业务层处理
 * 
 * @author hydra
 * @date 2023-12-17
 */
@Service
public class HumidityPandora176ServiceImpl extends ServiceImpl<HumidityPandora176Mapper, HumidityPandora176> implements IHumidityPandora176Service {
    @Autowired
    private HumidityPandora176Mapper humidityPandora176Mapper;

    /**
     * 查询潘多拉176湿度表
     * @param id 潘多拉176湿度表主键
     * @return 潘多拉176湿度表
     */
    @Override
    public HumidityPandora176 selectHumidityPandora176ById(Long id) {
        return humidityPandora176Mapper.selectHumidityPandora176ById(id);
    }

    /**
     * 查询潘多拉176湿度表列表
     * @param humidityPandora176 潘多拉176湿度表
     * @return 潘多拉176湿度表
     */
    @Override
    public List<HumidityPandora176> selectHumidityPandora176List(HumidityPandora176 humidityPandora176) {
        return humidityPandora176Mapper.selectHumidityPandora176List(humidityPandora176);
    }

    /**
     * 新增潘多拉176湿度表
     * @param humidityPandora176 潘多拉176湿度表
     * @return 结果
     */
    @Override
    public boolean create(HumidityPandora176 humidityPandora176) {
        return save(humidityPandora176);
    }

    /**
     * 修改潘多拉176湿度表
     * @param humidityPandora176 潘多拉176湿度表
     * @return 结果
     */
    @Override
    public boolean update(HumidityPandora176 humidityPandora176) {
        return updateById(humidityPandora176);
    }

    /**
     * 批量删除潘多拉176湿度表
     * @param ids 需要删除的潘多拉176湿度表主键
     * @return 结果
     */
    @Override
    public int deleteHumidityPandora176ByIds(Long[] ids) {
        return humidityPandora176Mapper.deleteBatchIds(Arrays.asList(ids));
    }

    /**
     * 删除潘多拉176湿度表信息
     * @param id 潘多拉176湿度表主键
     * @return 结果
     */
    @Override
    public int deleteHumidityPandora176ById(Long id) {
        return humidityPandora176Mapper.deleteById(id);
    }
}
