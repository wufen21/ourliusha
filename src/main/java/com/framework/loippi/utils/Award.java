package com.framework.loippi.utils;



import java.util.Random;

public class Award {
	
	public  int  base=1;
	public  int  base1=1;
	public  int  base2=4;
	public  int  base3=6;
	public  int  base4=7;
	public  int  base5=8;
	public  int  base6=9;
	
public  Object[][] prizeArr6(){
		
		if(base<1){
			base=1000;
		}
		// 里面的指针转动
		int i=2*base;
		Object[][] prizeArr = new Object[][] {
				{ 1, 1, 13, "一等奖", 2 },
				{ 2, 17, 43, "继续努力", i }, 
				{ 3, 47, 73, "二等奖", 4 },
				{ 4, 77, 103, "再接再厉", i },
				{ 5, 107, 133, "三等奖", 5 },
				{ 6, 137, 163, "谢谢参与", i},
				{ 7, 167, 193,"四等奖", 7 },
				{ 8,227 , 253, "不要泄气",i},
				{ 9, 227, 253, "五等奖",8 },
				{ 10,257,283, "再接再厉", i },
				{ 11, 287, 313, "六等奖", 9 },
				{ 12, 317, 343, "谢谢参与", i }};
		return prizeArr;
	}
	
	
	public  Object[][] prizeArr5(){
		
		if(base<1){
			base=1000;
		}
		// 里面的指针转动
		int i=2*base;
		Object[][] prizeArr = new Object[][] {
				{ 1, 1, 27,"五等奖", base5}, 
				
				{ 2, 33, 56,"三等奖", base3}, 
				{ 3, 63, 86,  "六等奖", base6},
				{ 4, 93, 116,"二等奖", base2 },
				{ 5, 123,146, "四等奖", base4},
				{ 6, 153, 176,"一等奖", base1 },
				{ 7, 183, 206,"一等奖", base1 },
				{ 8,213 ,236, "五等奖", base5},
				{ 9, 243, 266, "三等奖", base3},
				{ 10,273,296, "六等奖", base6 },
				{ 11, 303, 326,  "二等奖", base2 },
				{ 12,333,356,  "四等奖", base4}};
		
		return prizeArr;
	}
	
	public  Object[][] prizeArr4(){
		
		if(base<1){
			base=1000;
		}
		// 里面的指针转动
		int i=2*base;
		Object[][] prizeArr = new Object[][] {
				{ 1, 1, 27,"继续努力", i},
				{ 2, 33, 56, "六等奖", base6}, 
				{ 3, 63, 86, "继续努力", i},
				{ 4, 93, 116,"五等奖", base5 },
				{ 5, 123,146,"继续努力", i},
				{ 6, 153, 176,"四等奖", base4 },
				{ 7, 183, 206,"继续努力", i },
				{ 8,213 ,236, "三等奖", base3},
				{ 9, 243, 266,"继续努力", i},
				{ 10,273,296, "二等奖", base2 },
				{ 11, 303, 326,"继续努力", i },
				{ 12,333,356,  "一等奖", base1}};
		return prizeArr;
	}
	
	
	public  Object[][] prizeArr3(){
		
		if(base<1){
			base=1000;
		}
		// 里面的指针转动
		int i=2*base;
		Object[][] prizeArr = new Object[][] {
				{ 1, 1, 27,"继续努力", i},
				{ 2, 33, 56, "三等奖", base3}, 
				{ 3, 63, 86, "继续努力", i},
				{ 4, 93, 116,"二等奖", base2 },
				{ 5, 123,146,"继续努力", i},
				{ 6, 153, 176,"一等奖", base1},
				{ 7, 183, 206,"继续努力", i },
				{ 8,213 ,236, "三等奖", base3},
				{ 9, 243, 266,"继续努力", i},
				{ 10,273,296, "二等奖", base2 },
				{ 11, 303, 326,"继续努力", i },
				{ 12,333,356,  "一等奖", base1}};
		
		
		return prizeArr;
	}
	

public static void main(String[] args) {
		Object[][] prizeArr = new Object[][] {
				// id,min,max，prize【奖项】,v【中奖率】
				// 外面的转盘转动
				// {1,1,14,"一等奖",1},
				// {2,346,364,"一等奖",1},
				// {3,16,44,"不要灰心",10},
				// {4,46,74,"神马也没有",10},
				// {5,76,104,"祝您好运",10},
				// {6,106,134,"二等奖",2},
				// {7,136,164,"再接再厉",10},
				// {8,166,194,"神马也没有",10},
				// {9,196,224,"运气先攒着",10},
				// {10,226,254,"三等奖",5},
				// {11,256,284,"要加油哦",10},
				// {12,286,314,"神马也没有",10},
				// {13,316,344,"谢谢参与",10}

				// 里面的指针转动
				{ 1, 1, 14, "一等奖", 2 },
				{ 2, 16, 44, "继续努力", 10 }, 
				{ 3, 46, 74, "二等奖", 4 },
				{ 4, 76, 104, "再接再厉", 10 },
				{ 5, 106, 134, "三等奖", 5 },
				{ 6, 136, 164, "谢谢参与", 10 },
				{ 7, 166, 194,"一等奖", 2 },
				{ 8,226 , 254, "不要泄气",10},
				{ 9, 226, 254, "二等奖", 4 },
				{ 10,256,284, "再接再厉", 10 },
				{ 11, 286, 314, "三等奖", 5 },
				{ 12, 316, 344, "谢谢参与", 10 }};
		Award award=new Award();
		award.base=1000;
		Object result[] =award.award(prizeArr);// 抽奖后返回角度和奖品等级

		System.out.println("转动角度:" + result[0] + "\t奖项ID:" + result[1]
				+ "\t提示信息:" + result[2]);
	}

	// 抽奖并返回角度和奖项
	public Object[] award(Object[][] prizeArr) {
		// 概率数组
		Integer obj[] = new Integer[prizeArr.length];
		for (int i = 0; i < prizeArr.length; i++) {
			obj[i] = (Integer) prizeArr[i][4];
		}
		Integer prizeId = getRand(obj); // 根据概率获取奖项id
		// 旋转角度
		int angle = new Random().nextInt((Integer) prizeArr[prizeId][2]
				- (Integer) prizeArr[prizeId][1])
				+ (Integer) prizeArr[prizeId][1];
		String msg = (String) prizeArr[prizeId][3];// 提示信息
		return new Object[] { angle, prizeId, msg };
	}

	// 根据概率获取奖项
	public Integer getRand(Integer obj[]) {
		Integer result = null;
		System.err.println( obj.length);
		try {
			int sum = 0;// 概率数组的总概率精度
			for (int i = 0; i < obj.length; i++) {
				sum += obj[i];
			
			}
			System.err.println(sum);
			for (int i = 0; i < obj.length; i++) {// 概率数组循环
				int randomNum = new Random().nextInt(sum);// 随机生成1到sum的整数
				System.err.println(randomNum+"   中奖:"+ obj[i]);
				if (randomNum < obj[i]) {// 中奖
					result = i;
					break;
				} else {
					sum -= obj[i];
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	

}
