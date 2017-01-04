package com.system.rw.tools;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;

@Repository
public class CheckCode extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Font getFont() {
		Random random = new Random();
		Font font[] = new Font[5];
		font[0] = new Font("Ravie", Font.PLAIN, 24);
		font[1] = new Font("Antique Olive Compact", Font.PLAIN, 24);
		font[2] = new Font("Forte", Font.PLAIN, 24);
		font[3] = new Font("Wide Latin", Font.PLAIN, 24);
		font[4] = new Font("Gill Sans Ultra Bold", Font.PLAIN, 24);
		
	     return font[random.nextInt(5)];
	  }
	public void randCode(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 设置响应头 Content-type类型
				response.setContentType("image/jpeg");
				// 以下三句是用于设置页面不缓存
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "No-cache");
				response.setDateHeader("Expires", 0);

				OutputStream out = response.getOutputStream();
				int width = 83, height = 30;
				// 建立指定宽、高和BufferedImage对象
				BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);

				Graphics g = image.getGraphics(); // 该画笔画在image上
				Color c = g.getColor(); // 保存当前画笔的颜色，用完画笔后要回复现场
				g.fillRect(0, 0, width, height);//从左上角到右下角填充
				

				char[] ch = "AaBbcDdeFfGgHhjkmnpQqrsTtuvwxYyz23456789".toCharArray(); // 随即产生的字符串 不包括 i l(小写L) o（小写O） 1（数字1）0(数字0)
				int length = ch.length; // 随即字符串的长度
				String sRand = ""; // 保存随即产生的字符串
				Random random = new Random();
				for (int i = 0; i < 4; i++) {
					// 设置字体
					g.setFont(getFont());
					// 随即生成0-9的数字
					String rand = new Character(ch[random.nextInt(length)]).toString();
					sRand += rand;
					// 设置随机颜色
					g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
					g.drawString(rand, 20 * i, 25);
				}
				//产生随即干扰点
				for (int i = 0; i < 20; i++) {
					int x1 = random.nextInt(width);
					int y1 = random.nextInt(height);
					g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
					g.drawOval(x1, y1, 2, 2);
				}
				//画干扰线
				for (int i = 0; i < 10; i++) {
					int x1 = random.nextInt(width);
					int y1 = random.nextInt(height);
					g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
					g.drawLine(x1, y1, x1+10, y1);
				}
				g.setColor(c); // 将画笔的颜色再设置回去
				g.dispose();

				//将验证码记录到session
				request.getSession().setAttribute("safeCode", sRand);
				// 输出图像到页面
				ImageIO.write(image, "JPEG", out);
		
	}
}
