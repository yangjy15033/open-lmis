package org.openlmis.web.controller;

import org.openlmis.web.model.ReviewDataFilter;
import org.openlmis.web.response.OpenLmisResponse;
import org.openlmis.web.service.ReviewDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

import static org.openlmis.web.response.OpenLmisResponse.response;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class ReviewDataController extends BaseController {

  @Autowired
  private ReviewDataService reviewDataService;

  @RequestMapping(value = "review-data/filters", method = GET, headers = ACCEPT_JSON)
  @PreAuthorize("@permissionEvaluator.hasPermission(principal, 'VIEW_SYNCHRONIZED_DATA, EDIT_SYNCHRONIZED_DATA')")
  public ResponseEntity<OpenLmisResponse> getFilters() {
    return response("filter", reviewDataService.getFilters());
  }

  @RequestMapping(value = "review-data/list", method = POST, headers = ACCEPT_JSON)
  @PreAuthorize("@permissionEvaluator.hasPermission(principal, 'VIEW_SYNCHRONIZED_DATA, EDIT_SYNCHRONIZED_DATA')")
  public ResponseEntity<OpenLmisResponse> get(@RequestBody ReviewDataFilter filter, HttpServletRequest request) {
    return response("list", reviewDataService.get(filter, loggedInUserId(request)));
  }

}
