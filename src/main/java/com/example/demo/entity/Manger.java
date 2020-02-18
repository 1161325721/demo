package com.example.demo.entity;


public class Manger {

  private long manid;
  private String manaccount;
  private String manpassword;


  public long getManid() {
    return manid;
  }

  public void setManid(long manid) {
    this.manid = manid;
  }


  public String getManaccount() {
    return manaccount;
  }

  public void setManaccount(String manaccount) {
    this.manaccount = manaccount;
  }


  public String getManpassword() {
    return manpassword;
  }

  public void setManpassword(String manpassword) {
    this.manpassword = manpassword;
  }

  @Override
  public String toString()
  {
    return "Manger{" + "manid=" + manid + ", manaccount='" + manaccount + '\'' + ", manpassword='" + manpassword + '\'' + '}';
  }
}
