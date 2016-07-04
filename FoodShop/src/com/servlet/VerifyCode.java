package com.servlet;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

public class VerifyCode {
	//设置背景框宽高
	private int w=70;
	private int h=35;
	//设置随机产生数和字体
	private Random r=new Random();
	//设置字体
	private String[] fontNames={"宋体","华文楷体","黑体","微软雅黑","华文新魏","华文隶书",
			"楷体_GB2312"};
	//设置产生的数组与字母
	private String codes="23456789abcdefjhijkmnpqrstwxyzABCDEFGHIJKMNOPQRSTWXYZ";
	//设置背景颜色为白色
	private Color bgColor=new Color(255,255,255);
	private String text;
	
	//随机生成颜色方法
	private Color randomColor(){
		int red=r.nextInt(150);
		int green=r.nextInt(150);
		int blue=r.nextInt(150);
		return new Color(red,green,blue);
	}
	
	//随机生成字体方法
	private Font randomFont(){
		int index=r.nextInt(fontNames.length);
		String fontName=fontNames[index];
		int style=r.nextInt(6);
		int size=r.nextInt(5)+24;
		return new Font(fontName, style, size);
	}
	
	//随机产生干扰线
	private void drawLine(BufferedImage image){
		int num=3;
		Graphics2D g=(Graphics2D)image.getGraphics();
		for(int i=0;i<num;i++){
			int x1=r.nextInt(w);
			int y1=r.nextInt(h);
			int x2=r.nextInt(w);
			int y2=r.nextInt(h);
			g.setStroke(new BasicStroke(1.5F));
			g.setColor(Color.BLUE);
			g.drawLine(x1, y1, x2, y2);
		}
	}
	
	//画出随机字符
	private char randomChar(){
		int index=r.nextInt(codes.length());
		return codes.charAt(index);
	}
	
	//创建画板
	private BufferedImage createImage(){
		BufferedImage bi=new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
		Graphics2D g=(Graphics2D)bi.getGraphics();
		g.setColor(this.bgColor);
		g.fillRect(0, 0, w, h);
		return bi;
	}
	
	//调用该方法得到验证码
	public BufferedImage getImage(){
		BufferedImage image=createImage();
		Graphics2D g=(Graphics2D)image.getGraphics();
		StringBuilder sb=new StringBuilder();
		//向图中依次画如四个字符
		for(int i=0;i<4;i++){
			String s=randomChar()+"";
			sb.append(s);
			float x=i*1.0F*w/4;
			g.setFont(randomFont());
			g.setColor(randomColor());
			g.drawString(s, x, h-5);
		}
		this.text=sb.toString();
		drawLine(image);

		return image;
	}
	
	//返回需要输出的字符串
	public String getText(){
		return text;
	}
	
	//保存图片方法
	public static void output(BufferedImage image,OutputStream out) throws IOException{
		ImageIO.write(image, "JPEG", out);
	}
}
