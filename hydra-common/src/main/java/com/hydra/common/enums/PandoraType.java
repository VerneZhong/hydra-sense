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
    /**
     * 194
     */
    P194(194);
    private final int type;

    PandoraType(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }
}
