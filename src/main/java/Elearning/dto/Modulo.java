/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.dto;

/**
 *
 * @author Said
 */
public class Modulo {
    private Integer idModulo;
    private String unidad;
    private String leccion;
    private TipoCurso  idTipoCurso;

    public TipoCurso getIdTipoCurso() {
        return idTipoCurso;
    }

    public void setIdTipoCurso(TipoCurso idTipoCurso) {
        this.idTipoCurso = idTipoCurso;
    }
    
        public Integer getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Integer idModulo) {
        this.idModulo = idModulo;
    }
    
        public String getunidad() {
        return unidad;
    }

    public void setunidad(String unidad) {
        this.unidad = unidad;
    }
    
        public String getleccion() {
        return leccion;
    }

    public void setleccion(String leccion) {
        this.leccion = leccion;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getLeccion() {
        return leccion;
    }

    public void setLeccion(String leccion) {
        this.leccion = leccion;
    }
    

}
