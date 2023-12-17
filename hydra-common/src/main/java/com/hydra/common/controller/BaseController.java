package com.hydra.common.controller;

import cn.hutool.http.HttpStatus;
import com.github.pagehelper.PageInfo;
import com.hydra.common.page.TableDataInfo;
import com.hydra.common.utils.PageUtils;

import java.util.List;

/**
 * @author hydra
 * @description
 * @date 2022/7/19
 */
public class BaseController {

    /**
     * 设置请求分页数据
     */
    protected void startPage() {
        PageUtils.startPage();
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.HTTP_OK);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }
}
