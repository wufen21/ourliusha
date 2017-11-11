package com.framework.loippi.utils;

import java.awt.AlphaComposite;

import java.awt.Graphics2D;

import java.awt.Image;

import java.awt.image.BufferedImage;

import java.io.File;

import java.io.FileOutputStream;

import javax.imageio.ImageIO;

public class Withpictures {

	/**
	 * 
	 * 
	 * 
	 * @param filesrc
	 * 
	 * @param logosrc
	 * 
	 * @param outsrc
	 * 
	 * @param x
	 *            位置
	 * 
	 * @param y
	 *            位置
	 */

	public void composePic(String filesrc, String logosrc, String outsrc,
			int x, int y) {

		try {

			File bgfile = new File(filesrc);

			Image bg_src = javax.imageio.ImageIO.read(bgfile);

			File logofile = new File(logosrc);

			Image logo_src = javax.imageio.ImageIO.read(logofile);

			int bg_width = bg_src.getWidth(null);

			int bg_height = bg_src.getHeight(null);

			int logo_width = logo_src.getWidth(null);
			;
System.err.println(bg_width);
			int logo_height = logo_src.getHeight(null);
			System.err.println(bg_height);
			BufferedImage tag = new BufferedImage(bg_width, bg_height,
					BufferedImage.TYPE_INT_RGB);

			Graphics2D g2d = tag.createGraphics();

			g2d.drawImage(bg_src, 0, 0, bg_width, bg_height, null);

			g2d.setComposite(AlphaComposite.getInstance(
					AlphaComposite.SRC_ATOP, 1.0f)); // 透明度设置开始

			g2d.drawImage(logo_src, bg_width-logo_width-x, y, logo_width, logo_height, null);

			g2d.setComposite(AlphaComposite
					.getInstance(AlphaComposite.SRC_OVER)); // 透明度设置 结束

			FileOutputStream out = new FileOutputStream(outsrc);

			ImageIO.write(tag, "jpg", out);// 写图片

			/*
			 * JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			 * 
			 * encoder.encode(tag);
			 */

			out.close();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public static void main(String args[]) {

		Long star = System.currentTimeMillis();

		Withpictures pic = new Withpictures();

		pic.composePic("f:\\7.jpg", "f:\\6.png", "f:\\out.jpg", 33, 35);

		Long end = System.currentTimeMillis();

		System.out.print("time====:" + (end - star));

	}

}