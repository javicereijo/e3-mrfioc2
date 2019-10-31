#.cmd
#====

# Config section
# ================
epicsEnvSet("TOP", "$(E3_CMD_TOP)/../..")
iocshLoad("$(TOP)/iocsh/env-init.iocsh")

epicsEnvSet("LOCATION","MTCA:AMC2")

# run with: iocsh.bash -c 'epicsEnvSet("IOC", "PBIxx")' evr.cmd
epicsEnvSet("IOC", "CRATE07")
epicsEnvSet("DEV", "EVR")

# Require section
# ===============
require mrfioc2, 2.2.0-rc6

# Init section
# ============
# mTCA-XU
iocshLoad("$(TOP)/iocsh/evr-mtca-init.iocsh", "S=$(IOC), DEV=$(DEV), PCIID=$(MTCA_9U_PCIID12)")
# iocshLoad("$(TOP)/iocsh/evr-mtca-300.iocsh", "S=$(IOC), DEV=$(DEV), PCIID=0e:00.0, RT=wtRT")

iocInit()

# Run section
# ===========
iocshLoad("$(TOP)/iocsh/evr-mtca-run.iocsh", "IOC=$(IOC), DEV=$(DEV)")
iocshLoad("$(TOP)/iocsh/evr-mtca-output-run.iocsh", "IOC=$(IOC), DEV=$(DEV), BPOUT0='', EVT0=$(EVT_14HZ), BPOUT1='', EVT1=$(EVT_BPULSE_CM), BPOUT2='', EVT2=$(EVT_BPULSE_ST), BPOUT3='', EVT3=$(EVT_PPS), BPOUT4='', EVT4=$(EVT_PMORTEM), BPOUT5=#, EVT5=#, BPOUT6='', EVT6=$(EVT_DOD), BPOUT7=#, EVT7=#")
iocshLoad("$(TOP)/iocsh/evr-mtca-input-run.iocsh", "IOC=$(IOC), DEV=$(DEV), BPIN0=#, BPIN1=#, BPIN2=#, BPIN3=#, BPIN4=#, BPIN5='', EVT5=$(EVT_PMORTEMI), BPIN6=#, BPIN7='', EVT7=$(EVT_DODI)")

# dbl > "${IOC}_PVs.list"

#EOF
