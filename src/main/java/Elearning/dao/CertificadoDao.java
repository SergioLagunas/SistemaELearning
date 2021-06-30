
package Elearning.dao;

import Elearning.modelo.Certificado;
import java.util.List;


public interface CertificadoDao {
    
    public List<Certificado> findAll();
    public Certificado create(final Certificado elCertificado);
    public Certificado getCertificado(final Integer idCertificado);
    public Certificado update(final Certificado elCertificado);
    public boolean delete(final Certificado elCertificado);
    
}
