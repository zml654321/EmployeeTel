package com.chb.tools;
/*
定义常量的类
 */
public class constant {
    //汇率编辑权限
    public static final int ER_EDIT=1;
    //汇率放行权限
    public  static final int ER_REVIEW=2;
    //利率编辑权限
    public static final int IR_EDIT=3;
    //利率放行权限
    public static final int IR_REVIEW=4;
    // LDAP 访问地址
    public static final String LDAP_URL = "ldap://10.20.33.197:389";
    //LdapFactory
    public static final String LDAP_FACTORY = "com.sun.jndi.ldap.LdapCtxFactory";
    //DN,用户所在范围
    public static final  String DN="OU=Staff,OU=Office,DC=chbcn,DC=com,DC=cn";
    //用户名
    public static final String LDAP_ACCOUNT = "APADMIN";
    //密码
    public static final String LDAP_PWD= "CHB@2033";
    //行长秘书名字
    public static final String HANGZHANGMISHU="赵洁";

}
