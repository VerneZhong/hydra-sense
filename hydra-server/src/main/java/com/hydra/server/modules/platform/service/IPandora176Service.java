package com.hydra.server.modules.platform.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hydra.server.modules.platform.entity.Pandora176;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author hydra
 * @date 2023-12-18
 */
public interface IPandora176Service extends IService<Pandora176>{
    /**
     * 查询【请填写功能名称】列表
     * @param pandora176 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    List<Pandora176> selectPandora176List(Pandora176 pandora176);

    /**
     * 新增【请填写功能名称】
     * @param pandora176 【请填写功能名称】
     * @return 结果
     */
    boolean create(Pandora176 pandora176);

    /**
     * 修改【请填写功能名称】
     * @param pandora176 【请填写功能名称】
     * @return 结果
     */
    boolean update(Pandora176 pandora176);

    List<PandoraVo> queryList(PandoraQueryVo vo);
}
