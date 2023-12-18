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

    List<PandoraVo> queryList(PandoraQueryVo vo);
}
