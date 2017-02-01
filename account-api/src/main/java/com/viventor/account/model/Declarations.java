/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 *
 * @author manuelmerida
 */
@Entity
@Table(catalog = "viventor", schema = "accounts")
@NamedQueries({
    @NamedQuery(name = "Declarations.findAll", query = "SELECT d FROM Declarations d")})
public class Declarations implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GenericGenerator(
        name = "DeclarationsSequence",
        strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
        parameters = {
                @Parameter(name = "sequence_name", value = "declarations_sequence"),
                @Parameter(name = "force_table_use", value = "true"),
		@Parameter(name = "value_column", value = "id"),
                @Parameter(name = "initial_value", value = "1"),
                @Parameter(name = "increment_size", value = "1")
        }
    )
    @GeneratedValue(generator = "DeclarationsSequence")
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Long id;
    
    @Size(max = 500)
    @Column(length = 500)
    private String description;
    
    @JoinColumn(name = "declarationtypeid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    @JsonBackReference(value="declarations-declarationtype")
    private Declarationtype declarationtypeid;
    
    @JoinColumn(name = "transactionid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    @JsonBackReference(value="transactions-declarations")
    private Transactions transactionid;

    public Declarations() {
    }

    public Declarations(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Declarationtype getDeclarationtypeid() {
        return declarationtypeid;
    }

    public void setDeclarationtypeid(Declarationtype declarationtypeid) {
        this.declarationtypeid = declarationtypeid;
    }

    public Transactions getTransactionid() {
        return transactionid;
    }

    public void setTransactionid(Transactions transactionid) {
        this.transactionid = transactionid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Declarations)) {
            return false;
        }
        Declarations other = (Declarations) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.viventor.account.model.Declarations[ id=" + id + " ]";
    }
    
}
