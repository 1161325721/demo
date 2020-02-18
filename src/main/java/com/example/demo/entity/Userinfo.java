package com.example.demo.entity;


public class Userinfo {

  private long uid;
  private String uaccount;
  private String upassword;
  private String usex;
  private String uocc;
  private String uedu;
  private String uphone;
  private String uemail;
  private String ustate;


  public long getUid() {
    return uid;
  }

  public void setUid(long uid) {
    this.uid = uid;
  }


  public String getUaccount() {
    return uaccount;
  }

  public void setUaccount(String uaccount) {
    this.uaccount = uaccount;
  }


  public String getUpassword() {
    return upassword;
  }

  public void setUpassword(String upassword) {
    this.upassword = upassword;
  }


  public String getUsex() {
    return usex;
  }

  public void setUsex(String usex) {
    this.usex = usex;
  }


  public String getUocc() {
    return uocc;
  }

  public void setUocc(String uocc) {
    this.uocc = uocc;
  }


  public String getUedu() {
    return uedu;
  }

  public void setUedu(String uedu) {
    this.uedu = uedu;
  }


  public String getUphone() {
    return uphone;
  }

  public void setUphone(String uphone) {
    this.uphone = uphone;
  }


  public String getUemail() {
    return uemail;
  }

  public void setUemail(String uemail) {
    this.uemail = uemail;
  }


  public String getUstate() {
    return ustate;
  }

  public void setUstate(String ustate) {
    this.ustate = ustate;
  }

  @Override
  public String toString()
  {
    return "Userinfo{" + "uid=" + uid + ", uaccount='" + uaccount + '\'' + ", upassword='" + upassword + '\'' + ", usex='" + usex + '\'' + ", uocc='" + uocc + '\'' + ", uedu='" + uedu + '\'' + ", uphone='" + uphone + '\'' + ", uemail='" + uemail + '\'' + ", ustate='" + ustate + '\'' + '}';
  }
}
