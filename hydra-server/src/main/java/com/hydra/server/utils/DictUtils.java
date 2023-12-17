package com.hydra.server.utils;

import com.alibaba.fastjson2.JSONArray;
import com.hydra.common.component.redis.RedisCache;
import com.hydra.common.constant.CacheConstants;
import com.hydra.common.utils.SpringUtils;
import com.hydra.common.utils.StringUtils;
import com.hydra.server.modules.system.entity.XlDictData;

import java.util.Collection;
import java.util.List;

/**
 * @author
 * @description 字典工具类
 * @date 2022/8/26
 */
public class DictUtils {

    /**
     * 获取 cache key
     * @param key 参数键
     * @return 缓存键key
     */
    public static String getCacheKey(String key) {
        return CacheConstants.SYS_DICT_KEY + key;
    }

    /**
     * 获取字典缓存
     * @param key 参数键
     * @return dictDatas 字典数据列表
     */
    public static List<XlDictData> getDictCache(String key) {
        JSONArray arrayCache = SpringUtils.getBean(RedisCache.class).getCacheObject(getCacheKey(key));
        if (StringUtils.isNotNull(arrayCache)) {
            return arrayCache.toList(XlDictData.class);
        }
        return null;
    }
    /**
     * 设置字典缓存
     * @param key 参数键
     * @param dataList 字典数据列表
     */
    public static void setDictCache(String key, List<XlDictData> dataList) {
        SpringUtils.getBean(RedisCache.class).setCacheObject(getCacheKey(key),dataList);
    }

    /**
     * 清空字典缓存
     */
    public static void clearDictCache() {
        Collection<String> keys = SpringUtils.getBean(RedisCache.class).keys(CacheConstants.SYS_DICT_KEY + "*");
        SpringUtils.getBean(RedisCache.class).deleteObject(keys);
    }
}
