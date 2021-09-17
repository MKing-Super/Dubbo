package pers.mk.dubbo.learn.windows;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/9/17 23:06
 */
public class Login {


    public static void main(String[] args){
        Login lo=new Login();
        lo.showUI();
    }
    public void showUI(){
        javax.swing.JFrame jf= new javax.swing.JFrame();
        jf.setTitle("QQ登录界面");
        jf.setSize(300,400);
        jf.setDefaultCloseOperation(3);
        jf.setLocationRelativeTo(null);

        java.awt.FlowLayout flow=new java.awt.FlowLayout();
        jf.setLayout(flow);

        javax.swing.ImageIcon icon = new javax.swing.ImageIcon("D:\\Picture\\01.jpg");
        javax.swing.JLabel jla= new javax.swing.JLabel(icon);
        java.awt.Dimension dm0=new java.awt.Dimension(280,200);
        jla.setPreferredSize(dm0);
        jf.add(jla);

        javax.swing.JTextField jtf=new javax.swing.JTextField();
        java.awt.Dimension dm1=new java.awt.Dimension(200,30);
        jtf.setPreferredSize(dm1);
        jf.add(jtf);

        javax.swing.JTextField jtf2=new javax.swing.JTextField();
        java.awt.Dimension dm2=new java.awt.Dimension(200,30);
        jtf2.setPreferredSize(dm2);
        jf.add(jtf2);

        javax.swing.JCheckBox jcb3 = new javax.swing.JCheckBox("忘记密码");
        jf.add(jcb3);

        javax.swing.JCheckBox jcb4 = new javax.swing.JCheckBox("记住密码");
        jf.add(jcb4);

        javax.swing.JButton jbu = new javax.swing.JButton("登陆");
        java.awt.Dimension dm3=new java.awt.Dimension(80,30);
        jbu.setPreferredSize(dm3);
        jf.add(jbu);

        //给按钮添加动作监听器方法
        ButListener but = new ButListener();
        //创建一个监听器
        jbu.addActionListener(but);
        //把监听器加在“登录”按钮上
        but.setJt(jtf,jtf2);


        jf.setVisible(true);
    }
}
