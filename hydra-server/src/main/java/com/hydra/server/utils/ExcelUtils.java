package com.hydra.server.utils;

import com.alibaba.excel.EasyExcel;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author hydra
 * @description
 * @date 2022/10/25
 */
public class ExcelUtils {

    public static List<?> importEasyExcel(InputStream is, Class<?> pojoClass) throws Exception {
        return EasyExcel.read(is).head(pojoClass).sheet().doReadSync();
    }

    public static void exportEasyExcel(HttpServletResponse response, Class<?> pojoClass, List<?> list, String sheetName) {
        try {
            EasyExcel.write(response.getOutputStream(), pojoClass).sheet(sheetName).doWrite(list);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
    }
}
