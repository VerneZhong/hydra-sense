package com.hydra.server.modules.platform.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hydra.server.modules.platform.entity.Pandora194;
import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author hydra
 * @date 2023-12-18
 */
public interface IPandora194Service extends IService<Pandora194>{
    /**
     * 查询【请填写功能名称】列表
     * @param pandora176 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    List<Pandora194> selectPandora176List(Pandora194 pandora176);

    /**
     * 新增【请填写功能名称】
     * @param pandora176 【请填写功能名称】
     * @return 结果
     */
    boolean create(Pandora194 pandora176);

    /**
     * 修改【请填写功能名称】
     * @param pandora176 【请填写功能名称】
     * @return 结果
     */
    boolean update(Pandora194 pandora176);

    List<PandoraVo> queryList(PandoraQueryVo vo);
}
