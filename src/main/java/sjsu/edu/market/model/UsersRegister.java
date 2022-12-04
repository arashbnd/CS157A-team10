package sjsu.edu.market.model;

import java.io.Serializable;
import java.util.concurrent.atomic.AtomicInteger;

public class UsersRegister implements Serializable {

    private static final long serialVersionUID = 1L;
    private static final AtomicInteger count = new AtomicInteger(0);
    private int userid;
    private String firstname;
    private String lastname;
    private String address;
    private String phone;
    private String username;
    private String password;
    private String email;

    public UsersRegister(String userid, String firstname, String lastname, String address, String phone, String username,
                         String password, String email) {
        super();
        this.userid = count.incrementAndGet();
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.email = email;
    }
    public UsersRegister(String firstname, String lastname, String address, String phone, String username,
                         String password, String email) {
        this.userid = count.incrementAndGet();
        this.firstname = firstname;
        this.lastname = lastname;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.email = email;
    }
    public UsersRegister() {

    }

    public int getId() {
        return this.userid;
    }
    public void setId(int userid) {
        this.userid = userid;
    }
    public String getFirstName() {
        return firstname;
    }
    public void setFirstName(String fname) {
        this.firstname = fname;
    }
    public String getLastName() {
        return lastname;
    }
    public void setLastName(String lname) {
        this.lastname = lname;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}