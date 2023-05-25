#!/bin/csh
#
# This script spins up the model by using the CAM6 forcing data
source DART_params_reseed.csh
#=========================================================================

set spinupcount = 100

#=========================================================================
# Block 1: Get the current date
#=========================================================================
cd ${rundir}

set FILE = `head -n 1 rpointer.lnd`
set FILE = $FILE:r
set LND_DATE_EXT = `echo $FILE:e`
set LND_DATE     = `echo $FILE:e | sed -e "s#-# #g"`
set LND_YEAR     = `echo $LND_DATE[1] | bc`
set LND_MONTH    = `echo $LND_DATE[2] | bc`
set LND_DAY      = `echo $LND_DATE[3] | bc`
set LND_SECONDS  = `echo $LND_DATE[4] | bc`
set LND_HOUR     = `echo $LND_DATE[4] / 3600 | bc`

set SD_YEAR  =  `echo $LND_DATE[1] + 1 | bc`
set CURRDATE = `printf %04d%02d%02d ${LND_YEAR} ${LND_MONTH} ${LND_DAY}`

echo "valid time of model is $LND_YEAR $LND_MONTH $LND_DAY $LND_SECONDS (seconds)"

#=========================================================================
# Block 2: Move the generated files to a new fold to avoid being overwritten
# in next round of spin up
#=========================================================================
if ( ${CURRDATE} == 20200101 ) then
# Move the generated files to the sub direcotry spin_*
   @ spin_num = 1
   @ total_num=1000

   while (${spin_num} < ${total_num})
      set spin_dir = spin_${spin_num}
      set dir = ${rundir}/${spin_dir}
      if ( ! -d ${dir} ) then
         echo "${spin_dir} directory doesn't exist. Now build it"
         mkdir ${dir}
         ${MOVE} *.clm2.h0.*.nc ${spin_dir}
         ${MOVE} *.clm2.h1.*.nc ${spin_dir}
         ${MOVE} *-01-01-00000*.nc ${spin_dir}
         ${MOVE} *.bin ${spin_dir}
         ${MOVE} *.gz ${spin_dir}
         break
      endif
      @ spin_num ++
   end
   if ( ${spin_num} == ${spinupcount} ) then
      exit 0
   endif

   ${LINK} ${spin_dir}/${CASE}.clm2.r.2020-01-01-00000.nc   .
# Replace the initialization file and set CONTINUE_RUN=FALSE
   cd ${caseroot}
   if ( ${spin_num} == 1 ) then
      set fname = user_nl_clm
      sed s/inidata_file/${CASE}.clm2.r.2020-01-01-00000.nc/g ${fname}_temp >! ${fname}
   endif
   ./xmlchange RUN_REFCASE=${CASE}
   ./xmlchange RUN_REFDATE=2020-01-01
   ./xmlchange RUN_REFTOD=00000
   ./xmlchange RUN_STARTDATE=2011-01-01
   ./xmlchange STOP_DATE=20120101
   ./xmlchange CONTINUE_RUN=FALSE
   ./case.submit


# Set continuous run for 2011-2019
else
   if ( ${CURRDATE} == 20120101 ) then
      cd ${caseroot}
      ./xmlchange STOP_DATE=20130101
      ./xmlchange CONTINUE_RUN=TRUE
      ./xmlchange RESUBMIT=8
      ./case.submit
   else
      set STOPDATE = `printf %04d%02d%02d ${SD_YEAR} ${LND_MONTH} ${LND_DAY}`
      cd ${caseroot}
      ./xmlchange STOP_DATE=${STOPDATE}
   endif
endif

exit 0

