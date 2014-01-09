/* SpagoBI, the Open Source Business Intelligence suite

 * Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
 * This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
 * If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. */
package it.eng.spagobi.engine.cockpit.services;

import it.eng.spagobi.engine.cockpit.CockpitEngine;
import it.eng.spagobi.engine.cockpit.CockpitEngineInstance;

import it.eng.spagobi.utilities.engines.AbstractEngineStartServlet;
import it.eng.spagobi.utilities.engines.EngineConstants;
import it.eng.spagobi.utilities.engines.EngineStartServletIOManager;
import it.eng.spagobi.utilities.engines.SpagoBIEngineException;
import it.eng.spagobi.utilities.exceptions.SpagoBIServiceException;

import javax.servlet.RequestDispatcher;

import org.apache.log4j.Logger;
import org.json.JSONObject;


/**
 * @authors Andrea Gioia (andrea.gioia@eng.it)
 */
public class CockpitEngineStartEditAction extends AbstractEngineStartServlet {

	private static final long serialVersionUID = 1L;
	private static final String ENGINE_NAME = "CockpitReportEngine";
	private static final String REQUEST_DISPATCHER_URL = "/WEB-INF/jsp/geoReport.jsp";
	
	/** Logger component. */
    private static transient Logger logger = Logger.getLogger(CockpitEngineStartEditAction.class);
    
	
	public void doService( EngineStartServletIOManager servletIOManager ) throws SpagoBIEngineException {
		
		CockpitEngineInstance engineInstance;
		RequestDispatcher requestDispatcher;
		
         
        logger.debug("IN");
        
        try {
        	JSONObject template = null;
        	template = buildBaseTemplate();
     
        	
        	// create a new engine instance
        	engineInstance = CockpitEngine.createInstance(
        			template.toString(), // servletIOManager.getTemplateAsString(), 
        			servletIOManager.getEnv()
        	);
        	
        	
        	servletIOManager.getHttpSession().setAttribute(EngineConstants.ENGINE_INSTANCE, engineInstance);
        	
        	// dispatch the request to the presentation layer
        	requestDispatcher = getServletContext().getRequestDispatcher( REQUEST_DISPATCHER_URL );
            try {
            	requestDispatcher.forward(servletIOManager.getRequest(), servletIOManager.getResponse());
    		} catch (Throwable t) {
    			throw new SpagoBIServiceException(ENGINE_NAME, "An error occurred while dispatching request to [" + REQUEST_DISPATCHER_URL + "]", t);
    		} 
        } catch(Throwable t) {
        	logger.error("Impossible to execute document", t);
        	t.printStackTrace();
        	throw new SpagoBIServiceException(ENGINE_NAME, t);
        } finally {
        	logger.debug("OUT");        	 
        }        

	}
	private JSONObject buildBaseTemplate() {
		JSONObject template;
		
		logger.debug("IN");
		template = new JSONObject();
		logger.debug("OUT");
		
		return template;
	}
	

}
