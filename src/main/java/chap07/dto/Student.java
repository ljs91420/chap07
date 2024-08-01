package chap07.dto;

public class Student {
	String name;
	String school_name;
	Integer kor;
	Integer eng;
	Integer math;
	
	public Student(String name, String school_name, Integer kor, Integer eng, Integer math) {
		super();
		this.name = name;
		this.school_name = school_name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public Integer getKor() {
		return kor;
	}

	public void setKor(Integer kor) {
		this.kor = kor;
	}

	public Integer getEng() {
		return eng;
	}

	public void setEng(Integer eng) {
		this.eng = eng;
	}

	public Integer getMath() {
		return math;
	}

	public void setMath(Integer math) {
		this.math = math;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", school_name=" + school_name + ", kor=" + kor + ", eng=" + eng + ", math="
				+ math + "]";
	}
}
