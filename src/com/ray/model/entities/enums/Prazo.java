package com.ray.model.entities.enums;

public enum Prazo {

    NORMAL(3), PERSONALIZADO(5);

    private final int value;

    private Prazo(int value) {
	this.value = value;
    }

    public int getValue() {
	return value;
    }

}
