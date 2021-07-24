//===- DebugSubsection.cpp -----------------------------------*- C++-*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "llvm/DebugInfo/CodeView/DebugSubsection.h"

using namespace llvm::codeview;

DebugSubsectionRef::DebugSubsectionRef(DebugSubsectionKind Kind) : Kind(Kind) {}
DebugSubsectionRef::~DebugSubsectionRef() {}

DebugSubsection::DebugSubsection(DebugSubsectionKind Kind) : Kind(Kind) {}
DebugSubsection::~DebugSubsection() {}
