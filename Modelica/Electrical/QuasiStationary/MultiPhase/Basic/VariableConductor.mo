within Modelica.Electrical.QuasiStationary.MultiPhase.Basic;
model VariableConductor "Multiphase variable conductor"
  extends Interfaces.TwoPlug;
  parameter Modelica.SIunits.Temperature T_ref[m]=fill(293.15,m)
    "Reference temperatures";
  parameter MoveToModelica.SIunits.LinearTemperatureCoefficient alpha_ref[m]=zeros(m)
    "Temperature coefficient of resistance (G_actual = G_ref/(1 + alpha_ref*(heatPort.T - T_ref))";
  extends MoveToModelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort(final mh=m, T=T_ref);
  Modelica.Blocks.Interfaces.RealInput G_ref[m] 
    annotation (Placement(transformation(
        origin={0,110},
        extent={{-20,-20},{20,20}},
        rotation=270)));
  SinglePhase.Basic.VariableConductor variableResistor[m](
    final T_ref=T_ref,
    final alpha_ref=alpha_ref,
    each final useHeatPort=useHeatPort,
    final T=T) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0)));
equation
  connect(variableResistor.pin_p, plugToPins_p.pin_p) 
    annotation (Line(points={{-10,6.10623e-016},{-24.5,6.10623e-016},{-24.5,
          1.22125e-015},{-39,1.22125e-015},{-39,6.10623e-016},{-68,6.10623e-016}},
        color={85,170,255}));
  connect(variableResistor.pin_n, plugToPins_n.pin_n) 
    annotation (Line(points={{10,6.10623e-016},{39,6.10623e-016},{39,
          7.44522e-016},{68,7.44522e-016}}, color={85,170,255}));
  connect(variableResistor.heatPort, heatPort) 
    annotation (Line(points={{6.10623e-016,-10},{6.10623e-016,-32.5},{
          1.16573e-015,-32.5},{1.16573e-015,-55},{5.55112e-016,-55},{
          5.55112e-016,-100}}, color={191,0,0}));
  connect(G_ref, variableResistor.G_ref) 
    annotation (Line(points={{1.11022e-015,110},{1.11022e-015,85.25},{
          1.77635e-015,85.25},{1.77635e-015,60.5},{6.66134e-016,60.5},{
          6.66134e-016,11}}, color={0,0,127}));
  annotation (Icon(graphics={
        Text(extent={{100,-80},{-100,-40}}, textString=
                                               "%name"),
        Line(points={{60,0},{90,0}}),
        Line(points={{-90,0},{-60,0}}),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,90},{0,30}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{100,40},{-100,80}},
          lineColor={0,0,0},
          textString=
               "m=%m")}),
    Diagram(graphics),
  Documentation(info="<html>
<p>
The linear resistor connects the complex currents <i><u>i</u></i> with the complex
voltages <i><u>v</u></i> by <i><u>v</u>*G = <u>i</u></i>, 
using <i>m</i> <a href=Modelica://Modelica_QuasiStationary.SinglePhase.Basic.VariableConductor>single phase variable Conductors</a>. 
The conductances <i>G</i> are given as <i>m</i> input signals.
</p>

<p>
The conductor model also has <i>m</i> optional 
<a href=\"Modelica://Modelica.Electrical.MultiPhase.Interfaces.ConditionalHeatPort\">conditional heat ports</a>. 
A linear temperature dependency of the conductances for enabled heat ports is also taken into account.
</p>

<h4>See also</h4>
<p>
<a href=Modelica://Modelica_QuasiStationary.SinglePhase.Basic.VariableConductor>VariableConductor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.Resistor>Resistor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.Conductor>Conductor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.Capacitor>Capacitor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.Inductor>Inductor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.VariableResistor>Variable resistor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.VariableCapacitor>Variable capacitor</a>, 
<a href=Modelica://Modelica_QuasiStationary.MultiPhase.Basic.VariableInductor>Variable inductor</a>
</p>
</html>"));
end VariableConductor;
