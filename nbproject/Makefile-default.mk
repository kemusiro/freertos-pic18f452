#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=freertos/list.c freertos/tasks.c freertos/queue.c freertos/portable/MemMang/heap_2.c freertos/portable/MPLAB/PIC18F/port.c source/main.c source/serial/serial.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/freertos/list.o ${OBJECTDIR}/freertos/tasks.o ${OBJECTDIR}/freertos/queue.o ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/serial/serial.o
POSSIBLE_DEPFILES=${OBJECTDIR}/freertos/list.o.d ${OBJECTDIR}/freertos/tasks.o.d ${OBJECTDIR}/freertos/queue.o.d ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o.d ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o.d ${OBJECTDIR}/source/main.o.d ${OBJECTDIR}/source/serial/serial.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/freertos/list.o ${OBJECTDIR}/freertos/tasks.o ${OBJECTDIR}/freertos/queue.o ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/serial/serial.o

# Source Files
SOURCEFILES=freertos/list.c freertos/tasks.c freertos/queue.c freertos/portable/MemMang/heap_2.c freertos/portable/MPLAB/PIC18F/port.c source/main.c source/serial/serial.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F452
MP_PROCESSOR_OPTION_LD=18f452
MP_LINKER_DEBUG_OPTION=-r=ROM@0x7DC0:0x7FFF -r=RAM@GPR:0x5F4:0x5FF -u_DEBUGSTACK
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/freertos/list.o: freertos/list.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos" 
	@${RM} ${OBJECTDIR}/freertos/list.o.d 
	@${RM} ${OBJECTDIR}/freertos/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/list.o   freertos/list.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/list.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/tasks.o: freertos/tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos" 
	@${RM} ${OBJECTDIR}/freertos/tasks.o.d 
	@${RM} ${OBJECTDIR}/freertos/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/tasks.o   freertos/tasks.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/queue.o: freertos/queue.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos" 
	@${RM} ${OBJECTDIR}/freertos/queue.o.d 
	@${RM} ${OBJECTDIR}/freertos/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/queue.o   freertos/queue.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/portable/MemMang/heap_2.o: freertos/portable/MemMang/heap_2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos/portable/MemMang" 
	@${RM} ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o.d 
	@${RM} ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o   freertos/portable/MemMang/heap_2.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/portable/MemMang/heap_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o: freertos/portable/MPLAB/PIC18F/port.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos/portable/MPLAB/PIC18F" 
	@${RM} ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o.d 
	@${RM} ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o   freertos/portable/MPLAB/PIC18F/port.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/source/main.o: source/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/source/main.o   source/main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/source/main.o 
	@${FIXDEPS} "${OBJECTDIR}/source/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/source/serial/serial.o: source/serial/serial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/source/serial" 
	@${RM} ${OBJECTDIR}/source/serial/serial.o.d 
	@${RM} ${OBJECTDIR}/source/serial/serial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/source/serial/serial.o   source/serial/serial.c 
	@${DEP_GEN} -d ${OBJECTDIR}/source/serial/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/source/serial/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/freertos/list.o: freertos/list.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos" 
	@${RM} ${OBJECTDIR}/freertos/list.o.d 
	@${RM} ${OBJECTDIR}/freertos/list.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/list.o   freertos/list.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/list.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/tasks.o: freertos/tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos" 
	@${RM} ${OBJECTDIR}/freertos/tasks.o.d 
	@${RM} ${OBJECTDIR}/freertos/tasks.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/tasks.o   freertos/tasks.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/queue.o: freertos/queue.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos" 
	@${RM} ${OBJECTDIR}/freertos/queue.o.d 
	@${RM} ${OBJECTDIR}/freertos/queue.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/queue.o   freertos/queue.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/portable/MemMang/heap_2.o: freertos/portable/MemMang/heap_2.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos/portable/MemMang" 
	@${RM} ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o.d 
	@${RM} ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o   freertos/portable/MemMang/heap_2.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/portable/MemMang/heap_2.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/portable/MemMang/heap_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o: freertos/portable/MPLAB/PIC18F/port.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/freertos/portable/MPLAB/PIC18F" 
	@${RM} ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o.d 
	@${RM} ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o   freertos/portable/MPLAB/PIC18F/port.c 
	@${DEP_GEN} -d ${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o 
	@${FIXDEPS} "${OBJECTDIR}/freertos/portable/MPLAB/PIC18F/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/source/main.o: source/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/source" 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/source/main.o   source/main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/source/main.o 
	@${FIXDEPS} "${OBJECTDIR}/source/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/source/serial/serial.o: source/serial/serial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/source/serial" 
	@${RM} ${OBJECTDIR}/source/serial/serial.o.d 
	@${RM} ${OBJECTDIR}/source/serial/serial.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -DPIC18F -I"C:/Program Files (x86)/Microchip/mplabc18/v3.47/h" -I"source" -I"freertos/include" -I"freertos/portable/MPLAB/PIC18F" -I"freertos/portable/Common/include" -ms -oa- -Ls  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/source/serial/serial.o   source/serial/serial.c 
	@${DEP_GEN} -d ${OBJECTDIR}/source/serial/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/source/serial/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    source/18f452.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) "source\18f452.lkr"  -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   source/18f452.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) "source\18f452.lkr"  -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/FreeRTOS-PIC18F452.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
