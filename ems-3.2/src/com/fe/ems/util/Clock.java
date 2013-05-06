package com.fe.ems.util;

/**
 * @author troy(J2EE)
 * @version 1.0
 */
import java.util.Timer;
import java.util.TimerTask;
public class Clock {   
    private final Timer timer = new Timer();
    private final static long DELAY_TIME=5 * 1000;//�����ӳ�ʱ�䣺��λ����
    private final static long PERIO_TIME=10 * 1000;//������������: ��λ����
    public void start() { 
       timer.schedule(new SendMsgTask(), DELAY_TIME,PERIO_TIME);
    } 
   //public static void main(String[] args) { 
       //Clock test = new Clock(); 
       //test.start();
    //}
}
class SendMsgTask extends TimerTask{
    private static int i=0;
    public void run() { 
        sendMsg();
    } 
    private void sendMsg() {
        i++;
        System.out.println("���Ͷ��� -- ��ʼ (��"+i+"��)");
    } 
}

