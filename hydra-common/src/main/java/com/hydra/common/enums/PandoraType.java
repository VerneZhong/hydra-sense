package com.hydra.common.enums;

/**
 * Pandora table type
 * @author verne.zhong
 */
public enum PandoraType {
    /**
     * 176
     */
    P176(176),
    P193(193),
    /**
     * 194
     */
    P194(194),
    P197(197),
    P198(198),
    P199(199),
    ;
    private final int type;

    PandoraType(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }
}
