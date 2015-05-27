/* 
outflow.c
daily hydrologic outflow

*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
Biome-BGC version 4.2 (final release)
See copyright.txt for Copyright information
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
*/

#include "bgc.h"

int outflow(const siteconst_struct* sitec, const wstate_struct* ws,
wflux_struct* wf)
{
	/* calculates the outflow flux from the difference between soilwater
	and maximum soilwater */
	int ok=1;
	/* water in excess of saturation to outflow */
	//edited by Y.He, this wf->soilw_outflow_dummy is calculated with obs soil moisture, and will be used for calculating N leaching
	//change ws->soilw to ws->soilWobs
	if (ws->soilWobs > ws->soilw_sat_obs)  
	{
		wf->soilw_outflow_dummy = ws->soilWobs - ws->soilw_sat_obs;
	}
	else if (ws->soilWobs > ws->soilw_fc_obs)
	{
		wf->soilw_outflow_dummy = 0.5 *(ws->soilWobs - ws->soilw_fc_obs);
	}
	else
	{
		wf->soilw_outflow_dummy = 0.0;
	}
	//this was model output soil outflow calculated with modeled soil moisture
	if (ws->soilw > sitec->soilw_sat)  
        {
                wf->soilw_outflow = ws->soilw - sitec->soilw_sat;
        }
	/* slow drainage from saturation to field capacity */
	else if (ws->soilw > sitec->soilw_fc)
	{
		wf->soilw_outflow = 0.5 * (ws->soilw - sitec->soilw_fc);
	}
	/* otherwise, no outflow */
	else
	{
		wf->soilw_outflow = 0.0;
	}

	return(!ok);
}

