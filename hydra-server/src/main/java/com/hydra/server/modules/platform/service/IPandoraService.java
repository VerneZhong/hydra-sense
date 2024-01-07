package com.hydra.server.modules.platform.service;

import com.hydra.server.modules.platform.vo.PandoraQueryVo;
import com.hydra.server.modules.platform.vo.PandoraVo;

import java.util.List;

/**
 * 【pandora】Service接口
 * 
 * @author hydra
 * @date 2023-12-18
 */
public interface IPandoraService {

    /**
     * 查询列表
     * @param vo
     * @return
     */
    List<PandoraVo> queryList(PandoraQueryVo vo);
}
