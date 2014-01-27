package qms.forms;

import java.util.ArrayList;
import java.util.List;

import qms.model.CorrectiveAndPreventiveActions;
public class CorrectiveAndPreventiveActionsForm
{
	List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions=new ArrayList<CorrectiveAndPreventiveActions>();

	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions() {
		return correctiveAndPreventiveActions;
	}

	public void setCorrectiveAndPreventiveActions(
			List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions) {
		this.correctiveAndPreventiveActions = correctiveAndPreventiveActions;
	}
	
	
}