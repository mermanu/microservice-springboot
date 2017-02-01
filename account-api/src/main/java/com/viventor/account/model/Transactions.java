/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.model;

import com.viventor.account.utils.MoneySerializer;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.NumberFormat;

/**
 *
 * @author manuelmerida
 */
@Entity
@Table(catalog = "viventor", schema = "accounts")
@NamedQueries({
    @NamedQuery(name = "Transactions.findAll", query = "SELECT t FROM Transactions t")})
public class Transactions implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GenericGenerator(
        name = "TransactionsSequence",
        strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",
        parameters = {
                @Parameter(name = "sequence_name", value = "transactions_sequence"),
                @Parameter(name = "force_table_use", value = "true"),
		@Parameter(name = "value_column", value = "id"),
                @Parameter(name = "initial_value", value = "1"),
                @Parameter(name = "increment_size", value = "1")
        }
    )
    @GeneratedValue(generator = "TransactionsSequence")
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Long id;
    
    @Size(max = 500)
    @Column(length = 500)
    private String detail;
    
    @Size(max = 500)
    @Column(length = 500)
    private String origin;
    
    @Size(max = 500)
    @Column(length = 500)
    private String destiny;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    
    @Column(precision = 15, scale = 6)
    @JsonSerialize(using = MoneySerializer.class)
    private BigDecimal amount;
    
    @Column(precision = 15, scale = 6)
    @JsonSerialize(using = MoneySerializer.class)
    private BigDecimal balance;
    
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm a z")
    private Date date;
    
    @JoinColumn(name = "accountid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    @JsonBackReference(value="transactions-accounts")
    private Accounts accountid;
    
    @JoinColumn(name = "operationtypeid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    @JsonBackReference(value="transactions-operationtype")
    private Operationtype operationtypeid;
    
    @JoinColumn(name = "trantypeid", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    @JsonBackReference(value="transactions-trantype")
    private Trantype trantypeid;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "transactionid", fetch = FetchType.LAZY)
    @JsonManagedReference(value="transactions-declarations")
    private List<Declarations> declarationsList;

    public Transactions() {
    }

    public Transactions(Long id) {
        this.id = id;
    }

    public Transactions(Long id, Date date) {
        this.id = id;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestiny() {
        return destiny;
    }

    public void setDestiny(String destiny) {
        this.destiny = destiny;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public Accounts getAccountid() {
        return accountid;
    }

    public void setAccountid(Accounts accountid) {
        this.accountid = accountid;
    }

    public Operationtype getOperationtypeid() {
        return operationtypeid;
    }

    public void setOperationtypeid(Operationtype operationtypeid) {
        this.operationtypeid = operationtypeid;
    }

    public Trantype getTrantypeid() {
        return trantypeid;
    }

    public void setTrantypeid(Trantype trantypeid) {
        this.trantypeid = trantypeid;
    }

    public List<Declarations> getDeclarationsList() {
        return declarationsList;
    }

    public void setDeclarationsList(List<Declarations> declarationsList) {
        this.declarationsList = declarationsList;
    }
    
    @JsonProperty
    public String getTranTypeSymbol(){
        return trantypeid.getId() == 1 ? "+" : "-";
    }
    
    @JsonProperty
    public String getTranTypeDescription(){
        return trantypeid.getName();
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
        if (!(object instanceof Transactions)) {
            return false;
        }
        Transactions other = (Transactions) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.viventor.account.model.Transactions[ id=" + id + " ]";
    }
    
}
