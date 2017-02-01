/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
    @NamedQuery(name = "Trantype.findAll", query = "SELECT t FROM Trantype t")})
public class Trantype implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GenericGenerator(
        name = "TranTypeSequence",
        strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
        parameters = {
                @Parameter(name = "sequence_name", value = "trantype_sequence"),
                @Parameter(name = "force_table_use", value = "true"),
		@Parameter(name = "value_column", value = "id"),
                @Parameter(name = "initial_value", value = "1"),
                @Parameter(name = "increment_size", value = "1")
        }
    )
    @GeneratedValue(generator = "TranTypeSequence")
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Integer id;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(nullable = false, length = 10)
    private String name;
    
    @Size(max = 500)
    @Column(length = 500)
    private String description;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trantypeid", fetch = FetchType.LAZY)
    @JsonManagedReference(value="transactions-trantype")
    private List<Transactions> transactionsList;

    public Trantype() {
    }

    public Trantype(Integer id) {
        this.id = id;
    }

    public Trantype(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Transactions> getTransactionsList() {
        return transactionsList;
    }

    public void setTransactionsList(List<Transactions> transactionsList) {
        this.transactionsList = transactionsList;
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
        if (!(object instanceof Trantype)) {
            return false;
        }
        Trantype other = (Trantype) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.viventor.account.model.Trantype[ id=" + id + " ]";
    }
    
}
