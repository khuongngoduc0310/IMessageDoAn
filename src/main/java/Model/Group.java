package Model;

import java.util.ArrayList;

public class Group {
	private int Group_ID;
	private ArrayList<Integer> Members;
	public int getGroup_ID() {
		return Group_ID;
	}
	public void setGroup_ID(int group_ID) {
		Group_ID = group_ID;
	}
	public ArrayList<Integer> getMembers() {
		return Members;
	}
	public void setMembers(ArrayList<Integer> members) {
		Members = members;
	}
	public void deleteMember(int member_ID) {
		for (int i : Members) {
			if (i == member_ID)
				Members.remove(i);
		}
	}
	public void addMember(int member_ID) {
		Members.add(member_ID);
	}
}
