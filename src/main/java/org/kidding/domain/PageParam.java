package org.kidding.domain;

import lombok.Data;

@Data
public class PageParam {

	private static final double PER = 10.0;
	private int page;
	private int display;

	private int total, start, end, bno;
	private boolean prev, next;

	// 생성자. display를 기본으로 10개로 주는 것. 그리고 page는 기본적으로 1페이지로 가야 함.
	public PageParam() {
		this.page = 1;
		this.display = 10;
	}

	public int getSkip() {
		return (this.page - 1) * 10;
	}
	
	public void setTotal(int total) {
		this.total = total;

		// end 계산 다시 해봐
		// 상수값들은 이와 같이 간단히 빼줄 수 있음
		this.end = (int) (Math.ceil(this.page / PER)) * 10;
		this.start = this.end - 9;

		if ((this.end * 10) >= total) {
			this.end = (int) (Math.ceil(total / PER));
			this.next = false;
		} else {
			this.next = true;
		}
		this.prev = this.start != 1;
	}

	public static void main(String[] args) {
		PageParam obj = new PageParam();
		obj.setPage(3);
		obj.setTotal(78);

		System.out.println(obj);
	}
}
